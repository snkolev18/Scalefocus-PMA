// root/routes/collections/users.js


const express = require("express");
const router = express.Router();

const { DbSingleton } = require("../../lib/dbInstance");
const { UserRepository } = require("../../repositories/UserRepository");
const { TeamsRepository } = require("../../repositories/TeamsRepository");
const { ProjectRepository } = require("../../repositories/ProjectRepository");
const { isAuthenticated } = require("../../middlewares/authentication");

let users = undefined;
let teams = undefined;
let projects = undefined;
let tasks = undefined;

module.exports = router;


router.get("/projects", isAuthenticated, async function(req, res) {
	const _projects_ = await projects.getAll();
	res.render("projects.ejs", {
		projects: _projects_,
		loggedUserId: req.session.token.id
	})
});

router.get("/project/create", isAuthenticated, async function(req, res) {
	res.render("createProject.ejs");
});

router.post("/project/create", isAuthenticated, async function(req, res) {
	const project = req.body;
	console.log(project);
	const sc = await projects.create(project, req.session.token.id);
	if (sc) {
		res.send("There is already a project with this name");
		res.end();
		return;
	}
	res.redirect("/user/projects");
});

router.get("/project/edit/:id", isAuthenticated, async function(req, res) {
	const id = req.params.id;

	if (isNaN(id)) {
		res.send("Invalid ID")
		res.end();
		return;
	}

	const projectExistence = await projects.getProjectById(id);

	// Logs : Empty array => []
	console.log(projectExistence);
	if(projectExistence.length === 0) {
		res.status(404).send("Error appeared");
		return;
	}

	if (projectExistence[0].CreatorId != req.session.token.id) {
		res.send("Encountered an error");
		res.end();
		return;
	}
	// Returns array with an object so that why is the [0]
	const _teams_ = await teams.getAll();
	res.render("editProject.ejs", {
		teams: _teams_,
		id: id,
		project: projectExistence[0]
	})

});

router.post("/project/edit/", isAuthenticated, async function(req, res) {
	console.info(`Receiving new project data: ${req.body}`);
	const newProjectData = req.body;
	console.log(newProjectData);
	const sc = await projects.update(newProjectData, newProjectData.id, req.session.token.id);
	if (sc) {
		res.send("There is already a project with this title. Try again!");
		res.end();
		return;
	}

	res.redirect("/user/projects");
});


router.post("/project/assign", isAuthenticated, async function(req, res) {
	const data = req.body;
	const team = await teams.getIdByTitle(data.title);
	const checkProjectCreator = await projects.getProjectById(data.projectId);
	if (req.session.token.id !== checkProjectCreator[0].CreatorId) {
		res.send("That's not your project");
		res.end();
		return;
	}

	// Logs : An array with one object and propery id => e.x [ { Id: 1 } ]
	console.log(team);
	if (team === undefined) {
		res.send("Non existing team");
		res.end();
		return;
	}
	console.log(data);
	const result = await projects.assignProjectToTeam(data.projectId, team[0].Id);
	if (result) {
		res.send("This team is already assigned to this project")
		res.send();
		return;
	}
	console.log(result);

	res.redirect("/user/projects");
});

// This callbacks fire immediately so it can get the instance from the singleton class and then to make a single connection to the DB in the constructor of UsersRepository, TeamsRepository
(async () => {
	const temp = await DbSingleton.getInstance();
	users = new UserRepository();
	teams = new TeamsRepository();
	projects = new ProjectRepository();
	console.log("Connected");
})();
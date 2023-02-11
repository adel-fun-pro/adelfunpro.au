"use strict";

const URL_SIGNUP_LAMBDA =
	"https://ld41kdg243.execute-api.ap-southeast-2.amazonaws.com/default/adfp-signups";

const get_form_input = () => document.getElementById("form-signup");

const get_email_input = () => document.getElementById("input-email");

const update_signup_box = (message) => {
	const box = document.getElementById("text-signup");
	const input = get_email_input();
	input.hidden = true;
	box.hidden = false;
	box.textContent = message;
};

const send_email = (email) => {
	const req = new XMLHttpRequest();

	const form = new FormData();

	form.append("email", email);

	req.open("POST", URL_SIGNUP_LAMBDA);

	req.addEventListener("error", (_) =>
		update_signup_box("error registering " + req.response));

	req.addEventListener("load", (event) => {
		document.getElementById("form-submit").hidden = true;
		update_signup_box("registered " + email + "!")
	});

	req.send(form);
};

document.addEventListener("DOMContentLoaded", (_) =>
	get_form_input().addEventListener("submit", (event) => {
		event.preventDefault();
		send_email(get_email_input().value);
	}));

///@argument0 teamName
var teamName = argument0;
var bodyString = "teamName=" + teamName;
show_debug_message("send bodyString: " + bodyString);
req_getNewQuestionForTeam = http_post_string(host + "/questions" , bodyString);
install.packages("httpuv")

# httr::oauth_endpoint("github", "authorize", "access_token", base_url = "https://github.com/login/oauth")
myapp <- httr::oauth_app("github", "eb0e2d954e3c072e0e05", "59e73934db0cc7e51363d7c3b59c6daa35629b2b")
github_token <- httr::oauth2.0_token(httr::oauth_endpoints("github"), myapp)
#req <- GET("https://api.github.com/rate_limit", config(token = github_token))
#request1 <- httr::GET("https://api.github.com/repos/47deg/appsly-android-rest/commits?per_page=100", config(token = github_token))
#myjson <-  httr::content(request1)
#myjson2 <- jsonlite::fromJSON(toJSON(myjson))
#print(myjson2$author$login)
#print(jsonlite::fromJSON(toJSON(content(req))))
#View(myjson2)
#stop_for_status(request1)

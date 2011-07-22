quartz {
    autoStartup = false
    jdbcStore = false
    waitForJobsToCompleteOnShutdown = false
}

environments {
    test {
        quartz {
            autoStartup = false
        }
    }
}

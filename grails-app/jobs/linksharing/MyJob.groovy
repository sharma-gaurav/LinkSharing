package linksharing


class MyJob {
    static triggers = {
        cron name: 'myTrigger', cronExpression: "0 0 6 * * ?"
    }

    def execute() {
    }
}

// now in your controller (or service, or something else):


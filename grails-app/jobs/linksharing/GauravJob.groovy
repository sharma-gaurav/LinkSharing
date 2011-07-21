package linksharing


class GauravJob {
    static triggers = {
        cron name: 'myTrigger', cronExpression: "0/2 * * * * ?"
    }

    def group = "MyGroup"

    def execute() { print "Job run!" }
}

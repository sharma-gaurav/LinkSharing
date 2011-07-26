package linksharing


class MyJob {
    static triggers = {
        cron name: 'myTrigger', cronExpression: "0 0 6 * * ?"
    }

    def execute() {
        //  println context.mergedJobDataMap.get('foo')
        println "dshdhsjhsjdsjdj"
    }
}

// now in your controller (or service, or something else):


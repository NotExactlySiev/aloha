class Ninja {
    static put(s) {
        // TODO: write to a buffer?
        // should be an overridable callback thing
        System.write(s)
    }

    static nl() {
        put("\n")
    }

    static tab() {
        put("    ")
    }

    static build(rule, target, direct, indirect) {
        put("build " + target + ": " + rule)
        for (src in direct) {
            put(" " + src)
        }
        if (indirect.count > 0){
            put(" |")
            for (src in indirect) {
                put(" " + src)
            }
        }
        nl()
    }
    
    static build(rule, target, direct) {
        build(rule, target, direct, [])
    }

    static set(varName, val) {
        put(varName + " = " + val)
        nl()
    }

    static param(varName, val) {
        tab()
        set(varName, val)
    }

    static rule(name, cmd) {
        put("rule " + name)
        nl()
        param("command", cmd)
    }
}



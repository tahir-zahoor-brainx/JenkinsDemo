package com.brainx.jenkindemo

import java.util.regex.Matcher
import java.util.regex.Pattern

object AppUtils {
    fun isPasswordValid(password: String): Boolean {
        val pattern: Pattern
        val matcher: Matcher
        val passwordPattern = "^(?=.*?[A-Z])(?=.*?[0-9]).{5,}\$"
        pattern = Pattern.compile(passwordPattern)
        matcher = pattern.matcher(password)

        return matcher.matches() && password.length > 4
    }
}
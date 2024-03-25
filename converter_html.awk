BEGIN {
    print "<html>"
    print "<body>"
    print "<h1>API Output Live Verification Result</h1>"
}
NR > 0 {
    print "<pre>"$0"</pre>"
}
END {
    print "</body></html>"
}

node ${prefix}1.home.arpa {
    include webserver
    include linuxextras
    include hostips
}
node ${prefix}2.home.arpa {
    include logserver
    include linuxextras
    include hostips
}
node default {
    include linuxextras
}

function random_text {
    return -join ((65..90) + (97..122) | Get-Random -Count 10 | ForEach-Object {
        [char]$_
    })
}

random_text
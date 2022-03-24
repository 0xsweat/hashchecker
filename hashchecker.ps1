#!/bin/pwsh
# only supports sha512 sha256 md5
$ErrorActionPreference = 'silentlycontinue'
echo "Only supports salted hashes" |lolcat
$salt = "-salt"
function hashcheck {
    $hashquestion1 = Read-Host -MaskInput "What do you think the hash equals "
    if($salt -like "-salt"){
        $hashtask1 = $(openssl passwd ${hty} ${salt} ${hashquestion2} "${hashquestion1}")
    }
    if($salt -like $null){
        $hashtask1 = $(openssl passwd ${hty} "${hashquestion1}")
    }
    if($hashtask1 -like "$hash"){
        echo "Hash is correct!" |lolcat
        echo "${hash}:${hashquestion1}"
    }
    else{
        "HASH IS WRONG" | lolcat
    }
}
function hashtypechecking {
    if($hashcheck1 -like "1"){
        $hashtype1 = "SHA512"
    }
    if($hashcheck1 -like "2"){
        $hashtype1 = "MD5"
    }
    if($hashcheck1 -like "3"){
        $hashtype1 = "SHA256"
    }
    if($hashcheck1 -like "4"){
        $hashtype1 = "apache"
    }
    if($hashcheck1 -like "5"){
        $hashtype1 = "unix"
    }
}
function hashtypebruteforce {
    $hashcheck1 = 1
    $hashquestion1 = Read-Host -MaskInput "What do you think the hash equals "
    $hashcheck1 = 1
    $hty = "-6"
    #hashtypechecking
    $hashtask1 = $(openssl passwd ${hty} ${salt} ${hashquestion2} "${hashquestion1}")
    if($hashtask1 -like "$hash"){

        echo "Hash is correct!" |lolcat
       echo "Hash type is SHA512"
      echo "${hash}:${hashquestion1}"
    }
    else{
        "HASH IS WRONG" | lolcat
    }
    $hashcheck1 = 2
    $hty = "-1"
    #hashtypechecking
    $hashtask1 = $(openssl passwd ${hty} ${salt} ${hashquestion2} "${hashquestion1}")
    if($hashtask1 -like "$hash"){
       echo "Hash is correct!" |lolcat
       echo "Hash type is MD5"
        echo "${hash}:${hashquestion1}"
    }
    else{
        "HASH IS WRONG" | lolcat
    }
    $hashcheck1 = 3
    $hty = "-5"
    #hashtypechecking
    $hashtask1 = $(openssl passwd ${hty} ${salt} ${hashquestion2} "${hashquestion1}")
    if($hashtask1 -like "$hash"){
       echo "Hash is correct!" |lolcat
       echo "Hash type is SHA256"
        echo "${hash}:${hashquestion1}"
    }
    else{
        "HASH IS WRONG" | lolcat
    }
    $hashcheck1 = 4
    $hty = "-apr1"
    #hashtypechecking
    $hashtask1 = $(openssl passwd ${hty} ${salt} ${hashquestion2} "${hashquestion1}")
    if($hashtask1 -like "$hash"){
       echo "Hash is correct!" |lolcat
       echo "Hash type is apache"
        echo "${hash}:${hashquestion1}"
    }
    else{
        "HASH IS WRONG" | lolcat
    }
    $hashcheck1 = 5
    $hty = "-crypt"
    #hashtypechecking
    $hashtask1 = $(openssl passwd ${hty} ${salt} ${hashquestion2} "${hashquestion1}")
    if($hashtask1 -like "$hash"){
       echo "Hash is correct!" |lolcat
       echo "Hash type is unix"
        echo "${hash}:${hashquestion1}"
    }
    else{
        "HASH IS WRONG" | lolcat
    }
    
}
$hashreadoption = Read-Host "Would you like to type in a hash or read one from a file (file) (type) "
if($hashreadoption -like "file"){
    $hashfile = Read-Host "What is the hash file "
    $hash = $(cat ${hashfile})
}
else{
    $hash = Read-Host "What is the hash "
}
$hashquestion2 = Read-Host "What is the salt "
$hashtypequestion = Read-Host "Do you know what hash type it is (y) (n)"
if($hashtypequestion -like "y"){
    echo "only supports (md5) (sha512) (sha256) (apache) (unix)" | lolcat
    $hashtype = Read-Host "Choose a hash"
    if($hashtype -like "md5"){
        $hty = "-1"
    }
    if($hashtype -like "sha512"){
        $hty = "-6"
    }
    if($hashtype -like "sha256"){
        $hty = "-5"
    }
    if($hashtype -like "apache"){
        $hty = "-apr1"
    }
    if($hashtype -like "unix"){
        $hty = "-crypt"
    }
hashcheck
}
else{
    hashtypebruteforce
}
#$hashquestion3 = Read-Host "Does the hash have a salt (y) (n)"
#if($hashquestion3 -like "y"){
#    $salt = "-salt"
#    $hashquestion2 = Read-Host "What is the salt "
#}
# requirements : lolcat, openssl

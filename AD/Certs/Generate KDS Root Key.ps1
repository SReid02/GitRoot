Add-KdsRootKey -EffectiveTime ((get-date).addhours(-10)) #-10 hours is so we can use the cert right away or else we have to wait 10 hours to use them.
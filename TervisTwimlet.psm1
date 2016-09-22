#Requires -modules TwiMLPowerShell, TwilioTwimletPowerShell

Function New-TervisTwimletMessageAndRedirectURL {
    param (
        $Message,
        $URL
    )
    $TwiMLXMLDocument = New-TwiMLXMLDocument -InnerElements $(
        New-TwiMLResponse -InnerElements $(
            $(New-TwiMLSay -Message $Message),
            $(New-TwiMLRedirect -Method post -URL $URL)
        )
    )
    New-TwilioTwimletEchoURL -Twiml $TwiMLXMLDocument.OuterXml
}

Function New-TervisTwimletMessageAndRecordURL {
    param (
        $Message,
        $Action
    )
    $TwiMLXMLDocument = New-TwiMLXMLDocument -InnerElements $(
        New-TwiMLResponse -InnerElements $(
            $(New-TwiMLSay -Message $Message),
            $(New-TwiMLRecord -method POST -action $Action -maxLength 30)
        )
    )
    New-TwilioTwimletEchoURL -Twiml $TwiMLXMLDocument.OuterXml
}
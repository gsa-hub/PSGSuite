function Add-GSSlideSubstringMatchCriteria {
    <#
    .SYNOPSIS
    Creates a Google.Apis.Slides.v1.Data.SubstringMatchCriteria object.

    .DESCRIPTION
    Creates a Google.Apis.Slides.v1.Data.SubstringMatchCriteria object.

    .PARAMETER MatchCase
    Accepts the following type: [switch].

    .PARAMETER Text
    Accepts the following type: [string].

    .EXAMPLE
    Add-GSSlideSubstringMatchCriteria -MatchCase $matchCase -Text $text
    #>
    [OutputType('Google.Apis.Slides.v1.Data.SubstringMatchCriteria')]
    [CmdletBinding()]
    Param(
        [parameter()]
        [switch]
        $MatchCase,
        [parameter()]
        [string]
        $Text,
        [parameter(Mandatory = $false,ValueFromPipeline = $true,ParameterSetName = "InputObject")]
        [Google.Apis.Slides.v1.Data.SubstringMatchCriteria[]]
        $InputObject
    )
    Process {
        try {
            switch ($PSCmdlet.ParameterSetName) {
                Fields {
                    $obj = New-Object 'Google.Apis.Slides.v1.Data.SubstringMatchCriteria'
                    foreach ($prop in $PSBoundParameters.Keys | Where-Object {$obj.PSObject.Properties.Name -contains $_}) {
                        switch ($prop) {
                            default {
                                $obj.$prop = $PSBoundParameters[$prop]
                            }
                        }
                    }
                    $obj
                }
                InputObject {
                    foreach ($iObj in $InputObject) {
                        $obj = New-Object 'Google.Apis.Slides.v1.Data.SubstringMatchCriteria'
                        foreach ($prop in $iObj.PSObject.Properties.Name | Where-Object {$obj.PSObject.Properties.Name -contains $_ -and $_ -ne 'ETag'}) {
                            $obj.$prop = $iObj.$prop
                        }
                        $obj
                    }
                }
            }
        }
        catch {
            if ($ErrorActionPreference -eq 'Stop') {
                $PSCmdlet.ThrowTerminatingError($_)
            }
            else {
                Write-Error $_
            }
        }
    }
}

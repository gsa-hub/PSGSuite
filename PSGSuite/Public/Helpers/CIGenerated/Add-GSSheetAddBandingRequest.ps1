function Add-GSSheetAddBandingRequest {
    <#
    .SYNOPSIS
    Creates a AddBandingRequest to pass to Submit-GSSheetBatchUpdate.

    .DESCRIPTION
    Creates a AddBandingRequest to pass to Submit-GSSheetBatchUpdate.

    .PARAMETER BandedRange
    Accepts the following type: [Google.Apis.Sheets.v4.Data.BandedRange].

    To create this type, use the function Add-GSSheetBandedRange or instantiate the type directly via New-Object 'Google.Apis.Sheets.v4.Data.BandedRange'.

    .PARAMETER Requests
    Enables pipeline input of other requests of the same type.

    .EXAMPLE
    Add-GSSheetAddBandingRequest -BandedRange $bandedRange
    #>
    [OutputType('Google.Apis.Sheets.v4.Data.Request')]
    [CmdletBinding()]
    Param(
        [parameter()]
        [Google.Apis.Sheets.v4.Data.BandedRange]
        $BandedRange,
        [parameter(ValueFromPipeline = $true)]
        [Google.Apis.Sheets.v4.Data.Request[]]
        $Requests
    )
    Begin {
        Write-Verbose "Adding AddBandingRequest to the pipeline"
    }
    Process {
        $Requests
    }
    End {
        $newRequest = New-Object 'Google.Apis.Sheets.v4.Data.AddBandingRequest'
        foreach ($prop in $PSBoundParameters.Keys | Where-Object {$newRequest.PSObject.Properties.Name -contains $_}) {
            $newRequest.$prop = $PSBoundParameters[$prop]
        }
        try {
            New-Object 'Google.Apis.Sheets.v4.Data.Request' -Property @{
                AddBanding = $newRequest
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

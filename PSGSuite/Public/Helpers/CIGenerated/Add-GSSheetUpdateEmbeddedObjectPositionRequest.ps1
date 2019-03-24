function Add-GSSheetUpdateEmbeddedObjectPositionRequest {
    <#
    .SYNOPSIS
    Creates a UpdateEmbeddedObjectPositionRequest to pass to Submit-GSSheetBatchUpdate.

    .DESCRIPTION
    Creates a UpdateEmbeddedObjectPositionRequest to pass to Submit-GSSheetBatchUpdate.

    .PARAMETER Fields
    Accepts the following type: [System.Object].

    .PARAMETER NewPosition
    Accepts the following type: [Google.Apis.Sheets.v4.Data.EmbeddedObjectPosition].

    To create this type, use the function Add-GSSheetEmbeddedObjectPosition or instantiate the type directly via New-Object 'Google.Apis.Sheets.v4.Data.EmbeddedObjectPosition'.

    .PARAMETER ObjectId
    Accepts the following type: [System.Nullable[int]].

    .PARAMETER Requests
    Enables pipeline input of other requests of the same type.

    .EXAMPLE
    Add-GSSheetUpdateEmbeddedObjectPositionRequest -Fields $fields -NewPosition $newPosition -ObjectId $objectId
    #>
    [OutputType('Google.Apis.Sheets.v4.Data.Request')]
    [CmdletBinding()]
    Param(
        [parameter()]
        [System.Object]
        $Fields,
        [parameter()]
        [Google.Apis.Sheets.v4.Data.EmbeddedObjectPosition]
        $NewPosition,
        [parameter()]
        [System.Nullable[int]]
        $ObjectId,
        [parameter(ValueFromPipeline = $true)]
        [Google.Apis.Sheets.v4.Data.Request[]]
        $Requests
    )
    Begin {
        Write-Verbose "Adding UpdateEmbeddedObjectPositionRequest to the pipeline"
    }
    Process {
        $Requests
    }
    End {
        $newRequest = New-Object 'Google.Apis.Sheets.v4.Data.UpdateEmbeddedObjectPositionRequest'
        foreach ($prop in $PSBoundParameters.Keys | Where-Object {$newRequest.PSObject.Properties.Name -contains $_}) {
            $newRequest.$prop = $PSBoundParameters[$prop]
        }
        try {
            New-Object 'Google.Apis.Sheets.v4.Data.Request' -Property @{
                UpdateEmbeddedObjectPosition = $newRequest
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

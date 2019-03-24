function Add-GSSlideDeleteParagraphBulletsRequest {
    <#
    .SYNOPSIS
    Creates a DeleteParagraphBulletsRequest to pass to Submit-GSSlideBatchUpdate.

    .DESCRIPTION
    Creates a DeleteParagraphBulletsRequest to pass to Submit-GSSlideBatchUpdate.

    .PARAMETER CellLocation
    Accepts the following type: [Google.Apis.Slides.v1.Data.TableCellLocation].

    To create this type, use the function Add-GSSlideTableCellLocation or instantiate the type directly via New-Object 'Google.Apis.Slides.v1.Data.TableCellLocation'.

    .PARAMETER ObjectId
    Accepts the following type: [string].

    .PARAMETER TextRange
    Accepts the following type: [Google.Apis.Slides.v1.Data.Range].

    To create this type, use the function Add-GSSlideRange or instantiate the type directly via New-Object 'Google.Apis.Slides.v1.Data.Range'.

    .PARAMETER Requests
    Enables pipeline input of other requests of the same type.

    .EXAMPLE
    Add-GSSlideDeleteParagraphBulletsRequest -CellLocation $cellLocation -ObjectId $objectId -TextRange $textRange
    #>
    [OutputType('Google.Apis.Slides.v1.Data.Request')]
    [CmdletBinding()]
    Param(
        [parameter()]
        [Google.Apis.Slides.v1.Data.TableCellLocation]
        $CellLocation,
        [parameter()]
        [string]
        $ObjectId,
        [parameter()]
        [Google.Apis.Slides.v1.Data.Range]
        $TextRange,
        [parameter(ValueFromPipeline = $true)]
        [Google.Apis.Slides.v1.Data.Request[]]
        $Requests
    )
    Begin {
        Write-Verbose "Adding DeleteParagraphBulletsRequest to the pipeline"
    }
    Process {
        $Requests
    }
    End {
        $newRequest = New-Object 'Google.Apis.Slides.v1.Data.DeleteParagraphBulletsRequest'
        foreach ($prop in $PSBoundParameters.Keys | Where-Object {$newRequest.PSObject.Properties.Name -contains $_}) {
            $newRequest.$prop = $PSBoundParameters[$prop]
        }
        try {
            New-Object 'Google.Apis.Slides.v1.Data.Request' -Property @{
                DeleteParagraphBull = $newRequest
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

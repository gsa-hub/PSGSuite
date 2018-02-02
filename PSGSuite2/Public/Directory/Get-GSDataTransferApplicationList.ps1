﻿function Get-GSDataTransferApplicationList {
    <#
    .SYNOPSIS
    Gets the list of available Data Transfer Applications and their parameters
    
    .DESCRIPTION
    Gets the list of available Data Transfer Applications and their parameters
    
    .PARAMETER CustomerID
    The CustomerID you would like to list Data Transfer Applications for.

    Defaults to the CustomerID in the config
    
    .PARAMETER PageSize
    PageSize of the result set.

    Defaults to 500 (although it's typically a much smaller number for most Customers)
    
    .EXAMPLE
    Get-GSDataTransferApplicationList

    Gets the list of available Data Transfer Applications
    #>
    [cmdletbinding()]
    Param
    (
      [parameter(Mandatory=$false)]
      [ValidateNotNullOrEmpty()]
      [String]
      $CustomerID = $Script:PSGSuite.CustomerID,
      [parameter(Mandatory=$false)]
      [ValidateScript({[int]$_ -le 500 -and [int]$_ -ge 1})]
      [Int]
      $PageSize = 500
    )
    Begin {
        $serviceParams = @{
            Scope       = 'https://www.googleapis.com/auth/admin.datatransfer'
            ServiceType = 'Google.Apis.Admin.DataTransfer.datatransfer_v1.DataTransferService'
        }
        $service = New-GoogleService @serviceParams
    }
    Process {
        try {
            $request = $service.Applications.List()
            $request.CustomerId = $CustomerID
            if ($PageSize) {
                $request.MaxResults = $PageSize
            }
            Write-Verbose "Getting all Data Transfer Applications"
            $response = @()
            [int]$i = 1
            do {
                $result = $request.Execute()
                $response += $result.Applications
                if ($result.NextPageToken) {
                    $request.PageToken = $result.NextPageToken
                }
                [int]$retrieved = ($i + $result.Applications.Count) - 1
                Write-Verbose "Retrieved $retrieved Data Transfer Applications..."
                [int]$i = $i + $result.Applications.Count
            }
            until (!$result.NextPageToken)
            return $response
        }
        catch {
            $PSCmdlet.ThrowTerminatingError($_)
        }
    }
}
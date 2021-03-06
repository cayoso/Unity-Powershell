Function Get-Unityalert {

  <#
      .SYNOPSIS
      Information about alerts generated by the storage system. <br/> <br/> Alerts are usually events that require attention from the system administrator. Most, although not all, alerts indicate that there is a problem with the storage system. For example, you might receive an alert telling you that a disk has faulted, or that the storage system is running out of space. <br/> <br/> For information about configuring alerts, see the Help topics for the alertConfig and AlertConfigSNMPTarget resource types. <br/> <br/> <b>Some of the user-visible attributes in this object should be changed to eng-only.</b>  
      .DESCRIPTION
      Information about alerts generated by the storage system. <br/> <br/> Alerts are usually events that require attention from the system administrator. Most, although not all, alerts indicate that there is a problem with the storage system. For example, you might receive an alert telling you that a disk has faulted, or that the storage system is running out of space. <br/> <br/> For information about configuring alerts, see the Help topics for the alertConfig and AlertConfigSNMPTarget resource types. <br/> <br/> <b>Some of the user-visible attributes in this object should be changed to eng-only.</b>  
      You need to have an active session with the array.
      .NOTES
      Written by Erwan Quelin under MIT licence - https://github.com/equelin/Unity-Powershell/blob/master/LICENSE
      .LINK
      https://github.com/equelin/Unity-Powershell
      .PARAMETER Session
      Specifies an UnitySession Object.
      .PARAMETER ID
      Specifies the object ID.
      .EXAMPLE
      Get-Unityalert

      Retrieve information about all Unityalert
      .EXAMPLE
      Get-Unityalert -ID 'id01'

      Retrieves information about a specific Unityalert
  #>

  [CmdletBinding(DefaultParameterSetName='Name')]
  Param (
    [Parameter(Mandatory = $false,HelpMessage = 'EMC Unity Session')]
    $session = ($global:DefaultUnitySession | where-object {$_.IsConnected -eq $true}),
    [Parameter(Mandatory = $false,ParameterSetName='ID',ValueFromPipeline=$True,ValueFromPipelinebyPropertyName=$True,HelpMessage = 'Unityalert ID')]
    [String[]]$ID
  )

  Begin {
    Write-Debug -Message "[$($MyInvocation.MyCommand)] Executing function"

    #Initialazing variables
    $URI = '/api/types/alert/instances' #URI
    $TypeName = 'Unityalert'
  }

  Process {
    Foreach ($sess in $session) {

      Write-Debug -Message "[$($MyInvocation.MyCommand)] Processing Session: $($Session.Server) with SessionId: $($Session.SessionId)"

      Get-UnityItemByKey -Session $Sess -URI $URI -Typename $Typename -Key $PsCmdlet.ParameterSetName -Value $PSBoundParameters[$PsCmdlet.ParameterSetName]

    } # End Foreach ($sess in $session)
  } # End Process
} # End Function


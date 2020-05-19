function Get-MTUFragment {
    <#
        .SYNOPSIS
        Get-MTUFragment assists in determining the largest MTU size possible over a connection.

        .PARAMETER Target 
        Specifies hostname or IP to test packet size against
        
        .PARAMETER StartMTU
        Specifies the starting value of MTU to test

        .PARAMETER EndMTU
        Specifies the ending value of MTU to test

        .DESCRIPTION
        Get-MTUFragment will ping the target with packet sizes starting from StartMTU to EndMTU and incrementing by Increment.
        If inputs are incorrectly specified this command will fail. It utilizes the ping command from Windows to test.
        Results need to be reviewed in the console to find the MTU value where packets start fragmenting.

    #>

    param(
        [Parameter(Mandatory=$true)]
        [string]
        $Target,
        
        [Parameter(Mandatory=$true)]
        [Int32]
        $StartMTU,

        [Parameter(Mandatory=$true)]
        [Int32]
        $EndMTU,

        [Parameter(Mandatory=$true)]
        [Int32]
        $Increment
    )

    for ($i = $StartMTU; $i -le $EndMTU; $i += $Increment)
    {
        ping -n 1 -f -l $i $Target
    }
}
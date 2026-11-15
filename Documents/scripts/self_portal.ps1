Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$Form = New-Object System.Window.Forms.Form
$Form.Text = "Self-service portal"
$Form.Size = New.Object System.Drawing.Size(400,500)
$Form.BackColor = "White"
$Form.StartPosition = "CenterScreen"

$UserLabel = New-Object System.Windows.Forms.Label
$UserLabel.Text = "Username :"
$UserLabel.Location = New-Object System.Drawing.Point(20,20)
$UserLabel.Size =(100,20)
$Form.Controlls.Add($UserLabel)

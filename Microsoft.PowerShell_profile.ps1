#Set-PSReadlineKeyHandler -ChordTab -FunctionMenuComplete
Set-PSReadLineOption -PredictionSource History -PredictionViewStyle ListView
# function DailySaying {
#     echo "AT fi-rudo Zenkai!" | tte --xterm-colors --wrap-text beams
# }
#Set-Alias daysay DailySaying
#~/main.ps1
$env:POWERSHELL_UPDATECHECK = 'Off'
Set-Alias cl clear
Set-Alias vim nvim
Set-Alias lg lazygit
# Set-Alias s Fastfetch
Set-Alias m musicfox
#Set-Alias pj 'cd E:\project\'
# function Fastfetch {
#   fastfetch --config minimal
# }
Set-Alias lvim C:\Users\Administrator\.local\bin\lvim.ps1
function GoToProject {
    cd "e:/project"
}
Set-Alias pj GoToProject
# Set-Alias pj 'cd`e:/project/'
Set-Alias z zoxide.exe

# 这里可以放置你原本在配置文件中的其他命令


#oh-my-posh init pwsh | Invoke-Expression
function PicTonvim {
    chafa E:\wallpaper\kiss_risai.png --format symbols --symbols vhalf  --size 60x17 --stretch; sleep .1  
}
Set-Alias pic PicTonvim
function NvimandFzf {
  $fzfAndNvim = fzf
  cd $fzfAndNvim\..
  nvim ($fzfAndNvim)
}
Set-Alias vim NvimandFzf

Invoke-Expression (&starship init powershell)
Invoke-Expression (& { (zoxide init powershell | Out-String) })


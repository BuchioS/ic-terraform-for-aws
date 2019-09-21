resource "aws_key_pair" "auth" {
  key_name   = "id_rsa.pub"
/*
  public_key =  "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwm1H6NgFotBxiTSGQlVN6pKaFlUud8e0cjiQKm6tN1harK6fIBnmU2mGWPtkvMbycxgiQr3z8bTCu1C/87LBMkhv54bPY8NUho6yx82zn/pR7H/NxdamytWVwLvEHeGBDAnD9mBmgJASS1Xb4w9mz3PwOi5tPPJjvmCPw/Sv2gZB68m7eKvcOCPEsNiaP3YjMKDxFmH8NL5+sY6B/HO1x54OqhXimhMr+Emo+IAQTjJpWEfbHPjgXuxkmD8b6iRGu1/oDKar28vRqBskn7BE+zOQBPwhJKFq+0bi8djYDyVFzRJJQLRt5Y2Do+Ns0fekFDB1L5w7+Xog9xyKHT0cx suseri_home@aiesunoMacBook-Pro.local"
*/
  public_key =  "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwm1H6NgFotBxiTSGQlVN6pKaFlUud8e0cjiQKm6tN1harK6fIBnmU2mGWPtkvMbycxgiQr3z8bTCu1C/87LBMkhv54bPY8NUho6yx82zn/pR7H/NxdamytWVwLvEHeGBDAnD9mBmgJASS1Xb4w9mz3PwOi5tPPJjvmCPw/Sv2gZB68m7eKvcOCPEsNiaP3YjMKDxFmH8NL5+sY6B/HO1x54OqhXimhMr+Emo+IAQTjJpWEfbHPjgXuxkmD8b6iRGu1/oDKar28vRqBskn7BE+zOQBPwhJKFq+0bi8djYDyVFzRJJQLRt5Y2Do+Ns0fekFDB1L5w7+Xog9xyKHT0cx suseri_home@aiesunoMacBook-Pro.local"
}

resource "aws_key_pair" "auth_priv" {
  key_name   = "id_rsa_priv.pub"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCaPv31ALs9QYGPbXi+WAT1WOM0UrZxd8PNUYCS4kuTw4v858jdsVJmJnXv+A2UiGTvUioamzDJXFWqaT1t7lOcv2Q7XAqqq+6tPoVoXLLYRReJzqbfYwnrLTUsfT09iVFfuaak4AHgDvw3YnwQkrAnskxoj/GCdmzR1GNEN7B/uq/aTzSwOe342cyyWAXlFbRoBebgI7jTeQ1fRwHY68BvNq4LOko6AawCXd1W2URtixzqwg0P0TB3Hk+YvRe7pb9ZPN0ReJCDSYop+TMIYm9EOL0ZPma1KqXcH9Yuucnydwd8nuM5/+NwtOkZFOBV8BXLOeZRGJLUqlFAGnd+5wO7 suseri_home@aiesunoMacBook-Pro.local"
}
set shell := ["powershell.exe", "-NoProfile", "-Command"]

branch := `git branch --show-current`
repo := "SRuedesh/Create-Qualification-Reports"

default:
    just --list

render-cyp2d6:
    gh workflow run create-qualification_reports.yml --repo {{repo}} --ref {{branch}} -f commit-message="Update CYP2D6 qualification report"

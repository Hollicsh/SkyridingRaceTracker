#!/usr/bin/env python3
import subprocess
import sys
import os

def run_git(args, check=True):
    print(f"🧠 git {' '.join(args)}")
    subprocess.run(["git"] + args, check=check)

def create_and_push_annotated_tag(tag, message, token, repo):
    result = subprocess.run(["git", "tag", "-l", tag], capture_output=True, text=True)
    if tag in result.stdout.split():
        print(f"⚠️ Tag '{tag}' existiert bereits.")
        sys.exit(99)

    run_git(["config", "user.name", name])
    run_git(["config", "user.email", email])
    run_git(["tag", "-a", tag, "-m", message])

    remote_url = f"https://x-access-token:{token}@github.com/{repo}.git"
    run_git(["push", remote_url, f"refs/tags/{tag}"])

def main():
    if len(sys.argv) != 3:
        print("⚠️ Verwendung: tag_push.py <tag> <release-type>")
        sys.exit(99)

    tag = sys.argv[1]
    message = sys.argv[2]
    token = os.getenv("GITHUB_TOKEN")
    repo = os.getenv("GITHUB_REPOSITORY")
    name = sys.argv[3]
    email = sys.argv[4]
    
    if not token or not repo:
        print("⚠️ GITHUB_TOKEN oder GITHUB_REPOSITORY fehlen.")
        sys.exit(99)

    create_and_push_annotated_tag(tag, message, token, repo)

if __name__ == "__main__":
    main()

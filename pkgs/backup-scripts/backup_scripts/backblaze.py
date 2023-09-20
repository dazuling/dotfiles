"""
Execute a backup onto the Backblaze B2 cloud storage via Restic.
"""

import subprocess

# TODO: artbooks?
# TODO: atelier after cleanup
# TODO: archive after cleanup
RESTIC_SCRIPT = """
source /etc/nixos/pkgs/backup-scripts/.env.restic

restic backup \
    --exclude '**/.git/**' \
    --exclude '**/.stfolder/**' \
    --exclude '**/.stversions/**' \
    --exclude '**/.thumbnails/**' \
    --exclude '**/.direnv/**' \
    --exclude '**/.ruff_cache/**' \
    --exclude '**/.mypy_cache/**' \
    --exclude '**/.aux' \
    --exclude '**/.fls' \
    --exclude '**/.log' \
    --exclude '**/.fdb_latexmk' \
    --exclude '**/.out' \
    --exclude '**/.toc' \
    --exclude '**/.synctex*' \
    --exclude '**/.dvi' \
    --exclude '**/.4ct' \
    --exclude '**/.4tc' \
    --exclude '**/.idv' \
    --exclude '**/.lg' \
    --exclude '**/.tmp' \
    --exclude '**/.xref' \
    "$HOME/backups" \
    --exclude "$HOME/backups/signal-*" \
    --exclude "$HOME/backups/threema-*" \
    "$HOME/books" \
    "$HOME/documents" \
    "$HOME/images" \
    "$HOME/kpop" \
    "$HOME/music" \
    "$HOME/wlop" \
    "$HOME/.password-store" \
    "$HOME/.gnupg/pubring.kbx" \
    "$HOME/.gnupg/private-keys-v1.d" \
    "$HOME/.ssh"
"""


def backup_backblaze() -> None:
    subprocess.run(["bash", "-c", RESTIC_SCRIPT], check=True)

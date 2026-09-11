import sys
from pathlib import Path

RED = "\033[91m"
RESET = "\033[0m"


def check_translations(path: Path) -> bool:
    """Return True if the PO file contains invalid translations."""
    lines = path.read_text(encoding="utf-8").splitlines()
    has_errors = False

    for index, line in enumerate(lines):
        content = line.strip()
        line_number = index + 1

        if content.startswith("#,") and "fuzzy" in content:
            print(
                f"{RED}Fuzzy translation found in {path}:{line_number}{RESET} {content}"
            )
            has_errors = True

        if content == 'msgstr ""':
            next_line = lines[index + 1].strip() if index + 1 < len(lines) else ""

            if not next_line.startswith('"'):
                print(f"{RED}Empty translation found in {path}:{line_number}{RESET}")
                has_errors = True

    return has_errors


def main(files: list[str]) -> int:
    has_errors = False

    for path in map(Path, files):
        if path.suffix == ".po" and check_translations(path):
            has_errors = True

    return int(has_errors)


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))

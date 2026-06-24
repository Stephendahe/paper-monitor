import plistlib
from pathlib import Path


def build_launch_agent_plist(
    label: str,
    python_path: Path,
    module_name: str,
    working_directory: Path,
    config_path: Path,
    interval_seconds: int,
) -> bytes:
    log_directory = working_directory / "work" / "solid-battery-monitor" / "logs"
    launch_code = (
        "import sys; "
        "sys.path.insert(0, %r); "
        "from solid_battery_monitor.cli import main; "
        "raise SystemExit(main())"
    ) % str(working_directory)
    payload = {
        "Label": label,
        "ProgramArguments": [
            str(python_path),
            "-c",
            launch_code,
            "run",
            "--config",
            str(config_path),
        ],
        "WorkingDirectory": str(working_directory),
        "EnvironmentVariables": {
            "PYTHONPATH": str(working_directory),
        },
        "StartInterval": int(interval_seconds),
        "RunAtLoad": True,
        "StandardOutPath": str(log_directory / "solid-battery-monitor.out.log"),
        "StandardErrorPath": str(log_directory / "solid-battery-monitor.err.log"),
    }
    return plistlib.dumps(payload, sort_keys=False)

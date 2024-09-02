from .utils import run_cmd
from talon import Context, actions, ui, Module, app
import os
import glob

mod = Module()

TALON_RECORDINGS_DIR_PATH = "/Users/maciek/.talon/recordings"
TALON_BAD_RECOGNITIONS_DIR_PATH = "/Users/maciek/.talon/bad_recognitions"


def find_latest_flac_file(dir_path):
    list_of_files = glob.glob(dir_path + "/*.flac")
    latest_file = max(list_of_files, key=os.path.getctime)
    return latest_file


@mod.action_class
class Actions:
    def save_bad_recognition():
        """Saves the last recognition to special folder"""

        latest_file = find_latest_flac_file(TALON_RECORDINGS_DIR_PATH)
        txt_file = latest_file.replace(".flac", ".txt")
        run_cmd("mkdir -p " + TALON_BAD_RECOGNITIONS_DIR_PATH)
        run_cmd(f"cp '{latest_file}' {TALON_BAD_RECOGNITIONS_DIR_PATH}")
        run_cmd(f"cp '{txt_file}' {TALON_BAD_RECOGNITIONS_DIR_PATH}")

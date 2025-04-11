from talon import Module

mod = Module()


@mod.action_class
class Actions:
    def concat_2(s1: str, s2: str) -> str:
        """Concatenates 2 strings."""
        return f"{s1}{s2}"

    def concat_3(s1: str, s2: str, s3: str) -> str:
        """Concatenates 3 strings."""
        return f"{s1}{s2}{s3}"

    def concat_4(s1: str, s2: str, s3: str, s4: str) -> str:
        """Concatenates 4 strings."""
        return f"{s1}{s2}{s3}{s4}"

    def concat_5(s1: str, s2: str, s3: str, s4: str, s5: str) -> str:
        """Concatenates 5 strings."""
        return f"{s1}{s2}{s3}{s4}{s5}"

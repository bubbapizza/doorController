# Context manager example
# see also https://gist.github.com/Taar/d273325cfb97a1873e2a


from contextlib import contextmanager

@contextmanager
def ZeroOut(file_path):
    try:
        with open(file_path, "r") as f:
            yield f
    except IOError:
        yield None  # handle missing file
    finally:
        with open(file_path, "w"): pass

# class ...
    def readRFID(self):
        """Return the card number of the most recently read RFID card."""

        with ZeroOut(RFID_CARD_FILE) as f:
            return f.readline().strip() if f else None


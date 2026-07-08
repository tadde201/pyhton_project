bad = {
    b'f7f52a3f0f5f50360f1bd0839c1d95e99cdd19c0',
    b'2a14f4277c1975c5891526e61c594c2ba139b0af',
    b'2523ce4a6e98a66c79a57335bd95d0ed8c9455a9',
    b'9cbe98336324a854b3ddfa71bfe8130b2b1d82c7',
    b'5ccb133cad178004b96019531ce388146815ba61',
    b'3b16c802ef4568c1adb8c92c9aafefd283f7fe77',
    b'f733168170a5f0a1b1b1730a4474c6eada66f4f1',
    b'4ab97577e4da6338d772a80fca8b60fca522a5bc',
    b'1d45be9b4ae3b945a09e7823c8436a12e677ccae',
    b'26c891a8d9e12d1d8f74b5ca454ad476e8638cb8',
}


def commit_callback(commit):
    if commit.original_id in bad:
        commit.skip()

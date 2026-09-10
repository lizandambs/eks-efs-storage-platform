import os
import time

UPLOAD_FOLDER = "/app/uploads"
PROCESSED_FOLDER = "/app/uploads/processed"

os.makedirs(UPLOAD_FOLDER, exist_ok=True)
os.makedirs(PROCESSED_FOLDER, exist_ok=True)

print("Document worker started", flush=True)

while True:
    try:
        files = os.listdir(UPLOAD_FOLDER)

        for filename in files:

            if filename.startswith("."):
                continue

            source = os.path.join(
                UPLOAD_FOLDER,
                filename
            )

            processed = os.path.join(
                PROCESSED_FOLDER,
                filename + ".processed"
            )

            if (
                os.path.isfile(source)
                and not os.path.exists(processed)
            ):

                print(
                    f"Processing document: {filename}",
                    flush=True
                )

                with open(processed, "w") as output:
                    output.write(
                        f"Processed document: {filename}\n"
                    )

                print(
                    f"Completed document: {filename}",
                    flush=True
                )

    except Exception as error:

        print(
            f"Worker error: {error}",
            flush=True
        )

    time.sleep(10)
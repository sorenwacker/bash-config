#!/usr/bin/env python

import pandas as pd
import sys
from pathlib import Path

def convert_csv_to_parquet(csv_file, parquet_file=None):
    df = pd.read_csv(csv_file)
    if not parquet_file:
        parquet_file = Path(csv_file).with_suffix('.parquet')
    df.to_parquet(parquet_file)

if __name__ == "__main__":
    input_csv = sys.argv[1]
    output_parquet = sys.argv[2] if len(sys.argv) > 2 else None
    convert_csv_to_parquet(input_csv, output_parquet)
    print(f"Converted {input_csv} to {output_parquet}")


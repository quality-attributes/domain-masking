python3 -m venv venv

\venv\Scripts\activate.bat

pip install -r requirements.txt

ludwig experiment --comet --data_csv clean-nfr.csv --model_definition_file model_definition.yaml
ludwig experiment --comet --data_csv raw-nfr.csv --model_definition_file model_definition.yaml
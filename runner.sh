python3 -m venv venv

\venv\Scripts\activate.bat

pip install -r requirements.txt

ludwig experiment --model_name clean --experiment_name domain-masking --data_train_csv train.csv --data_test_csv test.csv --model_definition_file model_definition.yaml --comet
ludwig experiment --model_name raw --experiment_name domain-masking --data_train_csv raw_train.csv --data_test_csv raw_test.csv --model_definition_file model_definition.yaml --comet

ludwig visualize --visualization confusion_matrix --test_statistics results/domain-masking_clean/test_statistics.json --ground_truth_metadata results/domain-masking_clean/model/train_set_metadata.json --normalize
ludwig visualize --visualization confusion_matrix --test_statistics results/domain-masking_raw/test_statistics.json --ground_truth_metadata results/domain-masking_raw/model/train_set_metadata.json --normalize

ludwig visualize --visualization compare_classifiers_multiclass_multimetric  --test_statistics results/domain-masking_clean/test_statistics.json --ground_truth_metadata results/domain-masking_clean/model/train_set_metadata.json --comet
ludwig visualize --visualization compare_classifiers_multiclass_multimetric  --test_statistics results/raw/test_statistics.json --ground_truth_metadata results/raw/model/train_set_metadata.json
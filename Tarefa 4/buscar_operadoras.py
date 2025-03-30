from flask import Flask, request, jsonify
import pandas as pd
from flask_cors import CORS

app = Flask(__name__)
CORS(app)  # Ativa o CORS para todas as rotas e origens

csv_path = "Relatorio_cadop.csv"
df = pd.read_csv(csv_path, delimiter=';', dtype=str)

# Função para substituir apóstrofos por aspas duplas
def sanitize_value(value):
    if isinstance(value, str):
        # Substitui apóstrofos por aspas duplas
        value = value.replace("'", '"')
    return value

@app.route("/search-operadora")
def search_operadora():
    query = request.args.get("q", "").strip().lower()  # Captura o parâmetro 'q' da URL e converte para minúsculas
    
    if not query:
        return jsonify({"error": "Parâmetro 'q' é obrigatório"}), 400

    # Filtrar pelo Nome Fantasia ou Razão Social
    filtered_df = df[
        df["Nome_Fantasia"].str.lower().str.contains(query, na=False) |
        df["Razao_Social"].str.lower().str.contains(query, na=False)
    ]

    # Converter os resultados para lista de dicionários
    results = filtered_df.to_dict(orient="records")

    # Limpar os valores, substituindo apóstrofos
    sanitized_results = []
    for record in results:
        sanitized_record = {key: sanitize_value(value) for key, value in record.items()}
        sanitized_results.append(sanitized_record)

    return jsonify(sanitized_results), 200

if __name__ == '__main__':
    app.run(debug=True)

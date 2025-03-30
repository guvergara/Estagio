<template>
  <div id="app">
    <h1>Buscar Operadoras</h1>
    <div class="search-container"> 
      <input v-model="searchQuery" @keyup.enter="searchOperadora" placeholder="Digite o nome da operadora" class =  "search-input" />
      <button @click="searchOperadora" class="search-button">Buscar</button>
      <button @click="downloadPostmanCollection" class="download-button">Baixar Coleção Postman</button>
    </div>  

    <div v-if="loading">Carregando...</div>
    <div v-if="error" class="error">{{ error }}</div>

    <div v-if="operadoras.length > 0">
      <div v-for="(operadora, index) in operadoras" :key="index">
        <div v-for="(valor, chave) in operadora" :key="chave">
          <strong>{{ chave }}:</strong> {{ formatValue(valor) }}
        </div>
        <hr>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      searchQuery: '',
      operadoras: [],
      loading: false,
      error: null,
      lastRequest: null,
    };
  },
  methods: {
    async searchOperadora() {
      if (!this.searchQuery.trim()) return;

      this.loading = true;
      this.error = null;
      this.operadoras = [];

      const url = `http://127.0.0.1:5000/search-operadora?q=${encodeURIComponent(this.searchQuery)}`;
      this.lastRequest = url;

      try {
        const response = await axios.get(url, { transformResponse: [data => data] });
        console.log('Raw API response:', response.data);

        const sanitizedData = this.sanitizeJson(response.data);
        const parsedData = JSON.parse(sanitizedData);
        
        this.operadoras = Array.isArray(parsedData) ? parsedData : [parsedData];
      } catch (err) {
        console.error('Erro na busca:', err);
        this.error = 'Resposta da API em formato inválido';
      } finally {
        this.loading = false;
      }
    },
    sanitizeJson(rawData) {
      return rawData
        .replace(/"Fax":\s*NMI/g, '"Fax": null')
        .replace(/"([^"]+)":\s*([^"{}[\],\s]+)(?=[,\r\n}])/g, '"$1": "$2"')
        .replace(/'/g, '"')
        .replace(/,\s*}/g, '}')
    },
    formatValue(val) {
      return val === null || val === undefined ? 'Não disponível' : val;
    },
    downloadPostmanCollection() {
      if (!this.lastRequest) {
        alert("Nenhuma requisição foi feita ainda.");
        return;
      }

      const collection = {
        info: {
          name: "Teste de API - Operadoras",
          schema: "https://schema.getpostman.com/json/collection/v2.1.0/collection.json"
        },
        item: [
          {
            name: "Buscar Operadora",
            request: {
              method: "GET",
              url: {
                raw: this.lastRequest,
                protocol: "http",
                host: ["127.0.0.1"],
                port: "5000",
                path: ["search-operadora"],
                query: [
                  {
                    key: "q",
                    value: this.searchQuery
                  }
                ]
              },
              header: [
                {
                  key: "Content-Type",
                  value: "application/json"
                }
              ]
            }
          }
        ]
      };

      const blob = new Blob([JSON.stringify(collection, null, 2)], { type: "application/json" });
      const url = URL.createObjectURL(blob);
      const a = document.createElement("a");
      a.href = url;
      a.download = "postman_collection.json";
      document.body.appendChild(a);
      a.click();
      document.body.removeChild(a);
      URL.revokeObjectURL(url);
    }
  }
};
</script>


<style>
.search-container {
  display: flex;
  gap: 10px;
  margin-bottom: 20px;
}

.search-input {
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
  flex: 1;
  font-size: 16px;
}

.search-button {
  padding: 10px 20px;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  font-size: 16px;
  transition: background 0.3s;
}

.search-button:hover {
  background-color: #0056b3;
}
.error {
  color: red;
  padding: 10px;
  background: #ffeeee;
  border: 1px solid #ffcccc;
}
</style>

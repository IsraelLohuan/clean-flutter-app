# Local Load Surveys

> ## Caso de sucesso
1. ✔️ Sistema solicita os dados das enquetes do Cache
2. ✔️ Sistema entrega os dados das enquetes

> ## Exceção - Cache vazio
1. ✔️ Sistema retorna uma mensagem de erro inesperado

> ## Exceção - Dados inválidos no cache
1. Sistema retorna uma mensagem de erro inesperado

---  

# Local Validate Surveys

> ## Caso de sucesso
1. Sistema valida os dados recebidos do Cache

> ## Exceção - Dados inválidos no cache
1. Sistema limpa os dados do cache

---

# Local Save Surveys

> ## Caso de sucesso
1. Sistema valida os dados das enquetes
2. Sistema apaga os dados do Cache antigo
3. Sistema grava os novos dados do cache
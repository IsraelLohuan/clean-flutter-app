# Surveys Presenter

> ## Regras
1. ✔️ Chamar LoadSurveys no método loadData
2. Notificar o isLoadingStream como true antes de chamar o LoadSurveys
3. Notificar o isLoadingStream como false no fim do LoadSurveys
4. Notificar o loadSurveysStream com erro caso o LoadSurveys retorne erro
5. Notificar o loadSurveysStream com uma lista de Surveys caso o LoadSurveys retorn sucesso
6. Levar o usuário para tela de Resultado da Enquete ao clicar em alguma enquete
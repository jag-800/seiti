require 'openai'

class GptChatsController < ApplicationController
  def index
  end

  # 入力したテキストに対して返答
  # def search
  #   @query = params[:query]
  #   response = @client.chat(
  #     parameters: {
  #         model: "gpt-3.5-turbo",
  #         messages: [{ role: "user", content: @query }],
  #     })

  #   @chats = response.dig("choices", 0, "message", "content")
  # end

  # 入力したテキストに対して返答
  def search
    @query = params[:query]

    response = @client.create_completion("gpt-3.5-turbo", {
      prompt: @query,
      max_tokens: 100
    })
  
    # 処理されたテキストを抽出
    @chats = response['choices'][0]['text'].strip
  end
  
end


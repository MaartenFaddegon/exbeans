defmodule Deck do
  @moduledoc false

  @type deck :: list(Beans.bean())

  @spec new() :: deck()
  def new() do
    allBeans = [%Beans.GreenBean{}, %Beans.CoffeeBean{}, %Beans.BlueBean{}, %Beans.WaxBean{}, %Beans.BlackEyedBean{}]
    deck = for beanType <- allBeans do for _n <- 1..Beans.Bean.count(beanType) do beanType end end

    Enum.shuffle(List.flatten(deck))
  end

  @spec draw(deck()) :: {Beans.bean(), deck()}
  def draw([]) do
    :empty
  end
  def draw(deck) do
    [card | rest] = deck
    {card, rest}
  end

  @spec shuffle(deck()) :: deck()
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @spec add_to_deck(Beans.bean() | list(Beans.bean()), deck()) :: deck()
  def add_to_deck(beans, deck) when is_list(beans) do
    deck ++ beans
  end
  def add_to_deck(bean, deck) do
    deck ++ [bean]
  end

end
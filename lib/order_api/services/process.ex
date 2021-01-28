defmodule OrderApi.Services.Process do
  @moduledoc """
  this module has a function that creates a structure to be sent to an api
  """

  alias OrderApi.{Address, OrderItems, Orders}

  @doc """
  The structure function retrieves data from the database and assembles a structure, which is part of
  of a `post` request for host api`"https://delivery-center-recruitment-ap.herokuapp.com/"`

  ## Example

       iex> Process.structure()
       "{}"
  """
  def structure do
    orders = Orders.list_orders()
    address = Address.list_address() |> List.first()
    items = OrderItems.list_items() |> List.first()
    payment = Enum.map(orders, & &1.payments) |> first()

    processed =
      Enum.map(orders, fn order ->
        %{
          externalCode: "#{order.external_code}",
          storeId: order.store_id,
          subTotal: "#{order.total_amount}",
          deliveryFee: "#{order.delivery_fee}",
          total: "#{order.total_amount_with_shipping}",
          country: address.country.code,
          state: address.state.name,
          city: address.city.name,
          district: address.neighborhood.name,
          street: address.street_name,
          complement: address.comment,
          latitude: Decimal.to_float(address.latitude),
          longitude: Decimal.to_float(address.longitude),
          dtOrderCreate: order.date_created,
          postalCode: address.zip_code,
          number: address.street_number,
          total_shipping: Decimal.to_float(order.total_shipping),
          customer: %{
            externalCode: "#{order.buyer.external_code}",
            name: "#{order.buyer.first_name} #{order.buyer.last_name}",
            email: order.buyer.email,
            contact: address.receiver_phone
          },
          items: [
            %{
              externalCode: items.item.external_code,
              name: items.item.title,
              price: Decimal.to_float(items.unit_price),
              quantity: items.quantity,
              total: Decimal.to_float(items.full_unit_price),
              subItems: []
            }
          ],
          payments: [
            %{
              type: payment.payment_type,
              value: Decimal.to_float(payment.total_paid_amount)
            }
          ]
        }
      end)

    processed
    |> List.first()
    |> Jason.encode!()
  end

  defp first(payment) do
    [[head | _tail]] = payment
    head
  end
end

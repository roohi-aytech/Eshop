<g:select id="guarantee" name="guarantee.id"
          from="${guarantees}"
          optionKey="id"
          value="${producingProductInstance?.guarantee?.id}"

          noSelection="['': '']"/>




import numpy as np
import looker_sdk
from looker_sdk import models
import json
import configparser as ConfigParser
from numpy.lib.shape_base import column_stack
import pandas as pd
from pandas.core.frame import DataFrame
import urllib3
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)


# example running raw sql query via api
def run_sql_query(sql_query: str, connection_name: str):
    sql_constructor = models.SqlQueryCreate(
        connection_name=connection_name, sql=sql_query)
    create_query = sdk.create_sql_query(body=sql_constructor)
    query_slug = create_query.slug
    query = sdk.run_sql_query(slug=query_slug, result_format='json')
    query = json.loads(query)
    return query


# example running query from a model via api
def get_results_query(model: str, view: str, fields: str, sorts: str):
    query_build = models.WriteQuery(
        model=model,
        view=view,
        fields=fields,
        sorts=sorts
    )

    result = sdk.run_inline_query(result_format='json', body=query_build)
    result = json.loads(result)
    return result


# example function to compare queries, essentially taking the input from two queries /n
# iterating through these results and then returning a dict with the row label and bool
def compare_queries(query1, query2, join_key: str):
    test_reponse = {}
    query1 = json.loads(query1)
    query2 = query2

    q1df = pd.DataFrame(data=list(query1))
    q2df = pd.DataFrame(data=list(query2))

    compare = q1df.compare(q2df, keep_shape=True, keep_equal=True)
    eq = q1df.eq(q2df)
    compare['orders.user_id', 'Diff'] = eq['orders.user_id']
    compare['order_items.total_sale', 'Diff'] = eq['order_items.total_sale']

    


    # .all(axis=1)
    # test = q2df[q1df.ne(q2df).any(axis=1)]
    print(compare.head())
#     if test.loc[test['column name'] condition, 'new column name'] = 'value if condition is met'
# .bool() == False:
#         print('hurry')
    
    # try:
   
    # except ValueError:
    #     return 'Your query columns are not the same.'
    # else:
    #     pass
    # combined = q1df.merge(q2df, indicator=True, how='outer')

    # df_final = combined.swaplevel(axis='columns')[q1df.columns[1:]]
    # df_final.style.apply(highlight_diff, axis=None)
    # print(q1df.eq(q2df))
    # print(combined[(combined['orders.user_id'] == 19)])
    # print(df_final.xs('First', axis='columns', level=1))


def highlight_diff(data, color='yellow'):
    attr = 'background-color: {}'.format(color)
    other = data.xs('First', axis='columns', level=-1)
    return pd.DataFrame(np.where(data.ne(other, level=0), attr, ''),
                        index=data.index, columns=data.columns)


if __name__ == "__main__":
    sdk = looker_sdk.init31(config_file='/usr/local/google/home/hugoselbie/code_sample/py/projects/ini/looker.ini')
    query1 = sdk.run_look(look_id=17, result_format='json')
    
    sq1 = '''
        SELECT
            orders.user_id  AS `orders.user_id`,
            COALESCE(SUM(order_items.sale_price ), 0) AS `order_items.total_sale`
            
        FROM demo_db.order_items  AS order_items
        LEFT JOIN demo_db.orders  AS orders ON order_items.order_id = orders.id

        GROUP BY 1
ORDER BY orders.user_id  DESC
        LIMIT 500
    '''

    sq2 = '''
        SELECT
            orders.user_id  AS `orders.user_id`,
            56.0 AS `order_items.total_sale`
        FROM demo_db.order_items  AS order_items
        LEFT JOIN demo_db.orders  AS orders ON order_items.order_id = orders.id

        GROUP BY 1
ORDER BY orders.user_id  DESC
        LIMIT 500

    '''
    query2 = run_sql_query(sql_query=sq2, connection_name='thelook')

    t = compare_queries(query1=query1, query2=query2, join_key='orders.user_id')
    print(t)
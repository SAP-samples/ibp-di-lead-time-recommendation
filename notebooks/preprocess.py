import pandas as pd
#from DB import DataProvider as Prov
#from DB.DataProxy import DataProxy
import datetime



def preprocess_erp_lt_matdoc(data, date_col_raw, horizon=None):
    print('Preprocess data')

    #data = data[data['UOM'].isin(['CWT', 'KG'])]
    #data['PRDID'] = data['PRDID'].str.lstrip('0')

    data['IDATETIME'] = pd.to_datetime(data[date_col_raw], format = '%Y%m%d%H%M%S')

    first_date = min(data['IDATETIME'])
    print('First date raw: ' + str(first_date))

    last_date = max(data['IDATETIME'])
    print('Last date raw: ' + str(last_date))

    data = data.drop(date_col_raw, axis=1)

    if horizon:
        data = set_horizon(data, 'IDATETIME', horizon)

    return data


def set_horizon(data, date_col, horizon):
    data = data[data[date_col] >= pd.to_datetime(horizon)]
    print('Horizon set')
    first_date = min(data[date_col])
    print('First date: ' + str(first_date))
    return data


def add_time_columns_idx(data, granularity, time_idx_col, first_date, times):
    data['FIRST_DATE'] = pd.Series([first_date] * len(data[time_idx_col]))

    if granularity == 'week':
        data['DATE'] = data['FIRST_DATE'] + pd.to_timedelta(data[time_idx_col], unit='W')
    if granularity == 'day':
        data['DATE'] = data['FIRST_DATE'] + pd.to_timedelta(data[time_idx_col], unit='D')
    if granularity == 'hour':
        data['DATE'] = data['FIRST_DATE'] + pd.to_timedelta(data[time_idx_col], unit='h')
    if granularity == 'minute':
        data['DATE'] = data['FIRST_DATE'] + pd.to_timedelta(data[time_idx_col], unit='m')
    if granularity == 'second':
        data['DATE'] = data['FIRST_DATE'] + pd.to_timedelta(data[time_idx_col], unit='S')

    periodic_cols = []
    if 'hour' in times:
        data['HOUR'] = data['DATE'].dt.hour
        periodic_cols += ['HOUR']
    if 'weekday' in times:
        data['WEEKDAY'] = data['DATE'].dt.weekday
        periodic_cols += ['WEEKDAY']
    if 'weeknumber' in times:
        data['WEEKNUMBER'] = data['DATE'].dt.week
        periodic_cols += ['WEEKNUMBER']
    if 'month' in times:
        data['MONTH'] = data['DATE'].dt.month
        periodic_cols += ['MONTH']
    data = data.drop(['FIRST_DATE','DATE'], axis=1)
    return data, periodic_cols


def add_time_columns_date(data, date_col, times):
    if 'hour' in times:
        data['HOUR'] = data[date_col].dt.hour
    if 'weekday' in times:
        data['WEEKDAY'] = data[date_col].dt.weekday
    if 'weeknumber' in times:
        data['WEEKNUMBER'] = data[date_col].dt.week
    if 'month' in times:
        data['MONTH'] = data[date_col].dt.month
    return data

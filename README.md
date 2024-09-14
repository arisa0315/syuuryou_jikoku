# README

## テーブル一覧
1. **Shifts** - シフトに関連する情報
2. **Productions** - 生産数に関連する情報
3. **Users** - ユーザーに関連する情報


## 各テーブルの詳細

### Shifts
| カラム名       | 型          | 制約           |
| -------------- | ----------- | -------------- |
| id             | integer     | 主キー, NOT NULL |
| shift_name     | string      | NOT NULL       |
| cycle_time     | float       | NOT NULL       |
| performance    | float       | NOT NULL       |
| start_time     | datetime    | NOT NULL       |

#### アソシエーション
- has_many :productions
- has_many :users


### Productions
| カラム名           | 型          | 制約           |
| ------------------ | ----------- | -------------- |
| id                 | integer     | 主キー, NOT NULL |
| shift_id           | integer     | 外部キー, NOT NULL |
| production_quantity| integer     | NOT NULL       |
| end_time           | datetime    | 生産終了時刻は計算により自動設定 |
| created_at         | datetime    | 自動生成, NOT NULL |
| updated_at         | datetime    | 自動生成, NOT NULL |

#### アソシエーション
- belongs_to :shift


### Users
| カラム名       | 型          | 制約           |
| -------------- | ----------- | -------------- |
| id             | integer     | 主キー, NOT NULL |
| username       | string      | NOT NULL       |
| shift_id       | integer     | 外部キー, NOT NULL |

#### アソシエーション
- belongs_to :shift


## 生産終了時刻の計算
生産終了時刻は以下の計算式に基づきます：

`終了時刻 = 生産開始時刻 + (C.T × 生産数 × 出来高)`

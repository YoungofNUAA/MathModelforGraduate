import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import numpy as np
import matplotlib
from matplotlib.font_manager import FontProperties
plt.rcParams['font.sans-serif'] = ['SimHei']
plt.rcParams['font.family'] = 'sans-serif'
plt.rcParams['axes.unicode_minus'] = False
myFont = matplotlib.font_manager.FontProperties(fname=r"C:\Windows\Fonts\simsun.ttc",size=6)
myFont_Euclid = matplotlib.font_manager.FontProperties(fname=r"C:\Windows\Fonts\Euclid.ttf",size=6)
def count_num(num_list,num):
    num_sum = 0
    for i in range(len(num_list)):
        if num == num_list[i]:
            num_sum+=1
    return num_sum

def main():
    toBeCounted = [2,5,6,7,8,10,11,12,13,14,15,16,17,18]

    f = plt.figure(1)
    # plt.rcParams['font.sans-serif'] = ['SimHei']
    # plt.rcParams['font.family'] = 'sans-serif'
    # plt.rcParams['axes.unicode_minus'] = False
    #
    # title = ['     基站地理类型','基站所在栅格海拔高度','基站所在栅格绝对高度','测试点与正北方向夹角',
    #          '基站相对水平面高度','基站与测试点空间角','  基站发射信号功率','基站所在栅格海拔高度',
    #          '发射信号与正北方向夹角','基站所在栅格建筑物高度','基站发射机垂直机械下倾角','      信号实际下倾角',
    #          '信号强度中心与测试点相对高度','基站与测试点栅格水平距离','测试点所在栅格建筑物高度',
    #          '基站发射信号中心频率','基站与测试点直射链路距离','测试点所在栅格地理类型','    直射信号路径损耗','基站发射机电下倾角']
    title_num = ['内陆湖泊','市区开阔区域','道路开阔区域','植被区','灌木植被','城区超高层建筑(>60m)','城区高层建筑(40m~60m)'
                 ,'城区中高层建筑(20m~40m)','城区<20m高密度建筑群','城区<20m多层建筑','低密度工业建筑区域','高密度工业建筑区域'
                 ,'城郊','发达城郊区域']
    #
    # df = pd.read_csv('./train_data_Peking.dat')
    # df_corr = df.corr()
    # heatMap = sns.heatmap(df_corr,annot=True,annot_kws={'size':5,'weight':"bold"},xticklabels=title,yticklabels=title,vmax=0.8,vmin=-0.8
    #             ,cmap='Blues')
    # heatMap.tick_params(labelsize=4)
    # cax = plt.gcf().axes[-1]
    # cax.tick_params(labelsize=4)
    # plt.xticks(rotation=45,fontproperties=myFont)
    # plt.yticks(rotation=45,fontproperties=myFont)
    # plt.show()
    # f.savefig('heatMap.jpeg',dpi=600)


    # num2 = count_num(df['ClutterIndex'],2)
    # num5 = count_num(df['ClutterIndex'], 5)
    # num6 = count_num(df['ClutterIndex'], 6)
    # num7 = count_num(df['ClutterIndex'], 7)
    # num8 = count_num(df['ClutterIndex'], 8)
    # num10 = count_num(df['ClutterIndex'], 10)
    # num11 = count_num(df['ClutterIndex'], 11)
    # num12 = count_num(df['ClutterIndex'], 12)
    # num13 = count_num(df['ClutterIndex'], 13)
    # num14 = count_num(df['ClutterIndex'], 14)
    # num15 = count_num(df['ClutterIndex'], 15)
    # num16 = count_num(df['ClutterIndex'], 16)
    # num17 = count_num(df['ClutterIndex'], 17)
    # num18 = count_num(df['ClutterIndex'], 18)

    fig = plt.figure()

    all_bar = [157233,6159532,2397951,739713,108659,268933,151335,718328,776184,368303,135082,12374,13714,4492]
    plt.xticks(np.arange(14),title_num,fontproperties=myFont)
    plt.tick_params(labelsize=6)
    bar1 = plt.bar(np.arange(14), all_bar,color='b')

    plt.xticks(rotation=45)
    plt.yticks(fontproperties=myFont_Euclid)
    for a, b in zip(np.arange(14), all_bar):
        plt.text(a, b + 0.05, '%.0f' % b, ha='center', va='bottom', fontsize=7,fontproperties=myFont_Euclid)
    plt.show()
    fig.savefig('CountNum.jpeg', dpi=600)

    #画饼状图

    # fig = plt.figure()
    # plt.rcParams['figure.figsize'] = (6,12)
    # all_bar = [157233,6159532,2397951,739713,108659,268933,151335,718328,776184,368303,135082,12374,13714,4492]
    #
    # patches,l_text,p_text = plt.pie(all_bar,autopct='%3.1f%%',startangle=0,center=(-1,0))
    #
    # for t in l_text:
    #     t.set_size = (5)
    # for t in p_text:
    #     t.set_size = (5)
    # # 设置x，y轴刻度一致，这样饼图才能是圆的
    # plt.axis('equal')
    # plt.legend(title_num)
    # plt.show()
    #
    # fig.savefig('CountNum_pie.jpeg', dpi=1080)
if __name__ == '__main__':
    main()
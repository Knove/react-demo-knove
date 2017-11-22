/**
 * Created by Knove on 2017/11/20.
 */
import * as type from './type';

//webSocket
//获得在线人数
export function getOnlineNumber(onLineNumber){
    return (dispatch)=>{
        dispatch(getOnlineNumbertoStore(onLineNumber));
    }
}
export const getOnlineNumbertoStore=(onLineNumber)=>{
    return {type: type.WS_ONLINE_NUMBER,onLineNumber:onLineNumber}
}
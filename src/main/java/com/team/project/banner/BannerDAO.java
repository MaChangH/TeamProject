package com.team.project.banner;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.time.LocalDateTime;
import java.util.List;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.project.board.Board;
import com.team.project.board.BoardMapper;
import com.team.project.member.Member;

@Service
public class BannerDAO {

	@Autowired
	private SqlSession ss;

	// 금일, 금주 핫 게시글 가져오기
	public void bannerEvent(HttpServletRequest req) {
		List<Board> boards1 = ss.getMapper(BoardMapper.class).todayHot();
		List<Board> boards2 = ss.getMapper(BoardMapper.class).thisWeekHot();
		req.setAttribute("todayHot", boards1);
		req.setAttribute("thisWeekHot", boards2);

	}

	// 날씨 가져오기
	public String getWeather(HttpServletRequest req) {
		try {
			// 년도월일
			String API = "2uHK%2B1zR3G2nt5jtHEiF2Hik6%2BQBNURV5CIkIZjWCwXuaHEUXiOJMCjGJ1f1afoyswNWT18rzjhM4Q%2FQKWTIHw%3D%3D";
			LocalDateTime now = LocalDateTime.now();
			int year = now.getYear();
			int month = now.getMonthValue();
			int day = now.getDayOfMonth();
			String ymd = String.valueOf(year) + String.format("%02d%02d", month, day);

			// 기준시간
			int nowHour = now.getHour();
			int nowMinute = now.getMinute();
			String hour = "";
			if (nowMinute >= 30) { // 예보는 매 시간 30분에 작성되므로, 30분 이상이면 그 시간으로 데이터 파싱
				hour = String.format("%02d", nowHour) + "00";
			} else { // 매 시간 30분 전이면 1시간 전의 데이터 파싱
				nowHour--;
				if (nowHour == -1) {
					// 시간이 00시일 경우 1일을 뺀 날의 23시의 예보를 불러옴
					nowHour = 23;
					day = now.getDayOfMonth() - 1;
					ymd = String.valueOf(year) + String.format("%02d%02d", month, day);
				}
				hour = String.format("%02d", nowHour) + "00";
			}

//			System.out.println(ymd);
//			System.out.println(nowMinute);
//			System.out.println(hour);

			// 회원가입 당시 입력한 주소를 기준으로 예보지점 X, Y 좌표 얻기위함
			String city1 = null;
			String city2 = "";
			String city3 = "";
			Member m = (Member) req.getSession().getAttribute("loginMember");
			if (m == null || m.getTp_m_role() == 1) {
				city1 = "서울";
			} else {
				String[] cityArr1 = m.getTp_m_addr().split("!");
				String[] cityArr2 = cityArr1[1].split(" ");
				city1 = cityArr2[0];
				city2 = cityArr2[1];
				if (city2.equals("수원시") || city2.equals("성남시") || city2.equals("안양시") || city2.equals("안산시") || 
						city2.equals("고양시") || city2.equals("용인시") || city2.equals("창원시") || city2.equals("포항시") || 
						city2.equals("천안시") || city2.equals("청주시")) {
					city3 = cityArr2[2];
				}
			}

			String nX = null;
			String nY = null;
			// 지역이 서울
			if (city1.equals("서울")) {
				if (city2.equals("") || city2.equals("종로구") || city2.equals("중구")) {
					nX = "60";
					nY = "127";

				} else if (city2.equals("용산구")) {
					nX = "60";
					nY = "126";

				} else if (city2.equals("성동구") || city2.equals("동대문구") || city2.equals("성북구")) {
					nX = "61";
					nY = "127";

				} else if (city2.equals("강북구")) {
					nX = "61";
					nY = "128";

				} else if (city2.equals("도봉구") || city2.equals("노원구")) {
					nX = "61";
					nY = "129";

				} else if (city2.equals("서초구")) {
					nX = "61";
					nY = "125";

				} else if (city2.equals("강남구")) {
					nX = "61";
					nY = "126";

				} else if (city2.equals("광진구") || city2.equals("송파구") || city2.equals("강동구")) {
					nX = "62";
					nY = "126";

				} else if (city2.equals("중랑구")) {
					nX = "62";
					nY = "128";

				} else if (city2.equals("구로구")) {
					nX = "58";
					nY = "125";

				} else if (city2.equals("양천구") || city2.equals("강서구") || city2.equals("영등포구")) {
					nX = "58";
					nY = "126";

				} else if (city2.equals("금천구")) {
					nX = "59";
					nY = "124";

				} else if (city2.equals("동작구") || city2.equals("관악구")) {
					nX = "59";
					nY = "125";

				} else if (city2.equals("은평구") || city2.equals("서대문구") || city2.equals("마포구")) {
					nX = "59";
					nY = "127";

				}
			}

			// 지역이 경기도
			else if (city1.equals("경기")) {

				// 도시가 수원시
				if (city2.equals("수원시")) {
					if (city3.equals("장안구")) {
						nX = "60";
						nY = "121";

					} else if (city3.equals("권선구")) {
						nX = "60";
						nY = "120";

					} else if (city3.equals("팔달구")) {
						nX = "61";
						nY = "121";

					} else if (city3.equals("영통구")) {
						nX = "61";
						nY = "120";

					}
				}
				// 도시가 성남시
				else if (city2.equals("성남시")) {
					if (city3.equals("수정구")) {
						nX = "63";
						nY = "124";

					} else if (city3.equals("중원구")) {
						nX = "63";
						nY = "124";

					} else if (city3.equals("분당구")) {
						nX = "62";
						nY = "123";

					}
				}
				// 도시가 안양시
				else if (city2.equals("안양시")) {
					if (city3.equals("만안구")) {
						nX = "59";
						nY = "123";

					} else if (city3.equals("동안구")) {
						nX = "59";
						nY = "123";

					}
				}
				// 도시가 안산시
				else if (city2.equals("안산시")) {
					if (city3.equals("상록구")) {
						nX = "58";
						nY = "121";

					} else if (city3.equals("단원구")) {
						nX = "57";
						nY = "121";

					}
				}
				// 도시가 고양시
				else if (city2.equals("고양시")) {
					if (city3.equals("덕양구")) {
						nX = "57";
						nY = "128";

					} else if (city3.equals("일산동구")) {
						nX = "56";
						nY = "129";

					} else if (city3.equals("일산서구")) {
						nX = "56";
						nY = "129";

					}
				}
				// 도시가 용인시
				else if (city2.equals("용인시")) {
					if (city3.equals("처인구")) {
						nX = "64";
						nY = "119";

					} else if (city3.equals("기흥구")) {
						nX = "62";
						nY = "120";

					} else if (city3.equals("수지구")) {
						nX = "62";
						nY = "121";

					}
				} else if (city2.equals("의정부시")) {
					nX = "61";
					nY = "130";

				} else if (city2.equals("부천시")) {
					nX = "56";
					nY = "125";

				} else if (city2.equals("광명시")) {
					nX = "58";
					nY = "125";

				} else if (city2.equals("평택시")) {
					nX = "62";
					nY = "114";

				} else if (city2.equals("동두천시")) {
					nX = "61";
					nY = "134";

				} else if (city2.equals("과천시")) {
					nX = "60";
					nY = "124";

				} else if (city2.equals("구리시")) {
					nX = "62";
					nY = "127";

				} else if (city2.equals("남양주시")) {
					nX = "64";
					nY = "128";

				} else if (city2.equals("오산시")) {
					nX = "62";
					nY = "118";

				} else if (city2.equals("시흥시")) {
					nX = "57";
					nY = "123";

				} else if (city2.equals("군포시")) {
					nX = "59";
					nY = "122";

				} else if (city2.equals("의왕시")) {
					nX = "60";
					nY = "122";

				} else if (city2.equals("하남시")) {
					nX = "64";
					nY = "126";

				} else if (city2.equals("파주시")) {
					nX = "56";
					nY = "131";

				} else if (city2.equals("이천시")) {
					nX = "68";
					nY = "121";

				} else if (city2.equals("안성시")) {
					nX = "65";
					nY = "115";

				} else if (city2.equals("김포시")) {
					nX = "55";
					nY = "128";

				} else if (city2.equals("화성시")) {
					nX = "57";
					nY = "119";

				} else if (city2.equals("광주시")) {
					nX = "65";
					nY = "123";

				} else if (city2.equals("양주시")) {
					nX = "61";
					nY = "131";

				} else if (city2.equals("포천시")) {
					nX = "64";
					nY = "134";

				} else if (city2.equals("여주시")) {
					nX = "71";
					nY = "121";

				} else if (city2.equals("연천군")) {
					nX = "61";
					nY = "138";

				} else if (city2.equals("가평군")) {
					nX = "69";
					nY = "133";

				} else if (city2.equals("양평군")) {
					nX = "69";
					nY = "125";

				}
			}

			// 지역이 인천
			else if (city1.equals("인천")) {
				if (city2.equals("중구")) {
					nX = "54";
					nY = "125";
				} else if (city2.equals("동구")) {
					nX = "54";
					nY = "125";
				} else if (city2.equals("미추홀구")) {
					nX = "54";
					nY = "124";
				} else if (city2.equals("연수구")) {
					nX = "55";
					nY = "123";
				} else if (city2.equals("남동구")) {
					nX = "56";
					nY = "124";
				} else if (city2.equals("부평구")) {
					nX = "55";
					nY = "125";
				} else if (city2.equals("계양구")) {
					nX = "56";
					nY = "126";
				} else if (city2.equals("서구")) {
					nX = "55";
					nY = "126";
				} else if (city2.equals("강화군")) {
					nX = "51";
					nY = "130";
				} else if (city2.equals("옹진군")) {
					nX = "54";
					nY = "124";
				}

			}

			// 지역이 강원특별자치도
			else if (city1.equals("강원특별자치도")) {
				if (city2.equals("춘천시")) {
					nX = "73";
					nY = "134";
				} else if (city2.equals("원주시")) {
					nX = "76";
					nY = "122";
				} else if (city2.equals("강릉시")) {
					nX = "92";
					nY = "131";
				} else if (city2.equals("동해시")) {
					nX = "97";
					nY = "127";
				} else if (city2.equals("태백시")) {
					nX = "95";
					nY = "119";
				} else if (city2.equals("속초시")) {
					nX = "87";
					nY = "141";
				} else if (city2.equals("삼척시")) {
					nX = "98";
					nY = "125";
				} else if (city2.equals("홍천군")) {
					nX = "75";
					nY = "130";
				} else if (city2.equals("횡성군")) {
					nX = "77";
					nY = "125";
				} else if (city2.equals("영월군")) {
					nX = "86";
					nY = "119";
				} else if (city2.equals("평창군")) {
					nX = "84";
					nY = "123";
				} else if (city2.equals("정선군")) {
					nX = "89";
					nY = "123";
				} else if (city2.equals("철원군")) {
					nX = "65";
					nY = "139";
				} else if (city2.equals("화천군")) {
					nX = "72";
					nY = "139";
				} else if (city2.equals("양구군")) {
					nX = "75";
					nY = "139";
				} else if (city2.equals("인제군")) {
					nX = "80";
					nY = "138";
				} else if (city2.equals("고성군")) {
					nX = "85";
					nY = "145";
				} else if (city2.equals("양양군")) {
					nX = "88";
					nY = "138";
				}

			}

			// 지역이 경상남도
			else if (city1.equals("경남")) {
				if (city2.equals("창원시")) {
					if (city3.equals("의창구")) {
						nX = "90";
						nY = "77";
					} else if (city3.equals("성산구")) {
						nX = "91";
						nY = "76";
					} else if (city3.equals("마산합포구")) {
						nX = "89";
						nY = "76";
					} else if (city3.equals("마산회원구")) {
						nX = "89";
						nY = "76";
					} else if (city3.equals("진해구")) {
						nX = "91";
						nY = "75";
					}
				} else if (city2.equals("진주시")) {
					nX = "81";
					nY = "75";
				} else if (city2.equals("통영시")) {
					nX = "87";
					nY = "68";
				} else if (city2.equals("사천시")) {
					nX = "80";
					nY = "71";
				} else if (city2.equals("김해시")) {
					nX = "95";
					nY = "77";
				} else if (city2.equals("밀양시")) {
					nX = "92";
					nY = "83";
				} else if (city2.equals("거제시")) {
					nX = "90";
					nY = "69";
				} else if (city2.equals("양산시")) {
					nX = "97";
					nY = "79";
				} else if (city2.equals("의령군")) {
					nX = "83";
					nY = "78";
				} else if (city2.equals("함안군")) {
					nX = "86";
					nY = "77";
				} else if (city2.equals("창녕군")) {
					nX = "87";
					nY = "83";
				} else if (city2.equals("고성군")) {
					nX = "85";
					nY = "71";
				} else if (city2.equals("남해군")) {
					nX = "77";
					nY = "68";
				} else if (city2.equals("하동군")) {
					nX = "74";
					nY = "73";
				} else if (city2.equals("산청군")) {
					nX = "76";
					nY = "80";
				} else if (city2.equals("함양군")) {
					nX = "74";
					nY = "82";
				} else if (city2.equals("거창군")) {
					nX = "77";
					nY = "86";
				} else if (city2.equals("합천군")) {
					nX = "81";
					nY = "84";
				}
			}

			// 지역이 경상북도
			else if (city1.equals("경북")) {
				if (city2.equals("포항시")) {
					if (city3.equals("남구")) {
						nX = "102";
						nY = "94";
					} else if (city3.equals("북구")) {
						nX = "102";
						nY = "95";
					}
				} else if (city2.equals("경주시")) {
					nX = "100";
					nY = "91";
				} else if (city2.equals("김천시")) {
					nX = "80";
					nY = "96";
				} else if (city2.equals("안동시")) {
					nX = "91";
					nY = "106";
				} else if (city2.equals("구미시")) {
					nX = "84";
					nY = "96";
				} else if (city2.equals("영주시")) {
					nX = "89";
					nY = "111";
				} else if (city2.equals("영천시")) {
					nX = "95";
					nY = "93";
				} else if (city2.equals("상주시")) {
					nX = "81";
					nY = "102";
				} else if (city2.equals("문경시")) {
					nX = "81";
					nY = "106";
				} else if (city2.equals("경산시")) {
					nX = "91";
					nY = "90";
				} else if (city2.equals("군위군")) {
					nX = "88";
					nY = "99";
				} else if (city2.equals("의성군")) {
					nX = "90";
					nY = "101";
				} else if (city2.equals("청송군")) {
					nX = "96";
					nY = "103";
				} else if (city2.equals("영양군")) {
					nX = "97";
					nY = "108";
				} else if (city2.equals("영덕군")) {
					nX = "102";
					nY = "103";
				} else if (city2.equals("청도군")) {
					nX = "91";
					nY = "86";
				} else if (city2.equals("고령군")) {
					nX = "83";
					nY = "87";
				} else if (city2.equals("성주군")) {
					nX = "83";
					nY = "91";
				} else if (city2.equals("칠곡군")) {
					nX = "85";
					nY = "93";
				} else if (city2.equals("예천군")) {
					nX = "86";
					nY = "107";
				} else if (city2.equals("봉화군")) {
					nX = "90";
					nY = "113";
				} else if (city2.equals("울진군")) {
					nX = "102";
					nY = "115";
				} else if (city2.equals("울릉군")) {
					nX = "127";
					nY = "127";
				}
			}

			// 지역이 광주광역시
			else if (city1.equals("광주")) {
				if (city2.equals("동구")) {
					nX = "60";
					nY = "74";
				} else if (city2.equals("서구")) {
					nX = "59";
					nY = "74";
				} else if (city2.equals("남구")) {
					nX = "59";
					nY = "73";
				} else if (city2.equals("북구")) {
					nX = "59";
					nY = "75";
				} else if (city2.equals("광산구")) {
					nX = "57";
					nY = "74";
				}
			}

			// 지역이 대구광역시
			else if (city1.equals("대구")) {
				if (city2.equals("중구")) {
					nX = "89";
					nY = "90";
				} else if (city2.equals("동구")) {
					nX = "90";
					nY = "91";
				} else if (city2.equals("서구")) {
					nX = "88";
					nY = "90";
				} else if (city2.equals("남구")) {
					nX = "89";
					nY = "90";
				} else if (city2.equals("북구")) {
					nX = "89";
					nY = "91";
				} else if (city2.equals("수성구")) {
					nX = "89";
					nY = "90";
				} else if (city2.equals("달서구")) {
					nX = "88";
					nY = "90";
				} else if (city2.equals("달성군")) {
					nX = "86";
					nY = "88";
				}
			}

			// 지역이 대전광역시
			else if (city1.equals("대전")) {
				if (city2.equals("동구")) {
					nX = "68";
					nY = "100";
				} else if (city2.equals("중구")) {
					nX = "68";
					nY = "100";
				} else if (city2.equals("서구")) {
					nX = "67";
					nY = "100";
				} else if (city2.equals("유성구")) {
					nX = "67";
					nY = "101";
				} else if (city2.equals("대덕구")) {
					nX = "68";
					nY = "100";
				}
			}

			// 지역이 부산광역시
			else if (city1.equals("부산")) {
				if (city2.equals("중구")) {
					nX = "97";
					nY = "74";
				} else if (city2.equals("서구")) {
					nX = "97";
					nY = "74";
				} else if (city2.equals("동구")) {
					nX = "98";
					nY = "75";
				} else if (city2.equals("영도구")) {
					nX = "98";
					nY = "74";
				} else if (city2.equals("부산진구")) {
					nX = "97";
					nY = "75";
				} else if (city2.equals("동래구")) {
					nX = "98";
					nY = "76";
				} else if (city2.equals("남구")) {
					nX = "98";
					nY = "75";
				} else if (city2.equals("북구")) {
					nX = "96";
					nY = "76";
				} else if (city2.equals("해운대구")) {
					nX = "99";
					nY = "75";
				} else if (city2.equals("사하구")) {
					nX = "96";
					nY = "74";
				} else if (city2.equals("금정구")) {
					nX = "98";
					nY = "77";
				} else if (city2.equals("강서구")) {
					nX = "96";
					nY = "76";
				} else if (city2.equals("연제구")) {
					nX = "98";
					nY = "76";
				} else if (city2.equals("수영구")) {
					nX = "99";
					nY = "75";
				} else if (city2.equals("사상구")) {
					nX = "96";
					nY = "75";
				} else if (city2.equals("기장군")) {
					nX = "100";
					nY = "77";
				}
			}

			// 지역이 세종특별자치시
			else if (city1.equals("세종특별자치시")) {
				nX = "66";
				nY = "103";
			}

			// 지역이 울산광역시
			else if (city1.equals("울산")) {
				if (city2.equals("중구")) {
					nX = "102";
					nY = "84";
				} else if (city2.equals("남구")) {
					nX = "102";
					nY = "84";
				} else if (city2.equals("동구")) {
					nX = "104";
					nY = "83";
				} else if (city2.equals("북구")) {
					nX = "103";
					nY = "85";
				} else if (city2.equals("울주군")) {
					nX = "101";
					nY = "84";
				}
			}

			// 지역이 이어도
			else if (city1.equals("이어도")) {
				nX = "28";
				nY = "8";
			}

			// 지역이 전라남도
			else if (city1.equals("전남")) {
				if (city2.equals("목포시")) {
					nX = "50";
					nY = "67";
				} else if (city2.equals("여수시")) {
					nX = "73";
					nY = "66";
				} else if (city2.equals("순천시")) {
					nX = "70";
					nY = "705";
				} else if (city2.equals("나주시")) {
					nX = "56";
					nY = "71";
				} else if (city2.equals("광양시")) {
					nX = "73";
					nY = "70";
				} else if (city2.equals("담양군")) {
					nX = "61";
					nY = "78";
				} else if (city2.equals("곡성군")) {
					nX = "66";
					nY = "77";
				} else if (city2.equals("구례군")) {
					nX = "69";
					nY = "75";
				} else if (city2.equals("고흥군")) {
					nX = "66";
					nY = "62";
				} else if (city2.equals("보성군")) {
					nX = "62";
					nY = "66";
				} else if (city2.equals("화순군")) {
					nX = "61";
					nY = "72";
				} else if (city2.equals("장흥군")) {
					nX = "59";
					nY = "64";
				} else if (city2.equals("강진군")) {
					nX = "57";
					nY = "63";
				} else if (city2.equals("해남군")) {
					nX = "54";
					nY = "61";
				} else if (city2.equals("영암군")) {
					nX = "56";
					nY = "66";
				} else if (city2.equals("무안군")) {
					nX = "52";
					nY = "71";
				} else if (city2.equals("함평군")) {
					nX = "52";
					nY = "72";
				} else if (city2.equals("영광군")) {
					nX = "52";
					nY = "77";
				} else if (city2.equals("장성군")) {
					nX = "57";
					nY = "77";
				} else if (city2.equals("완도군")) {
					nX = "57";
					nY = "56";
				} else if (city2.equals("진도군")) {
					nX = "48";
					nY = "59";
				} else if (city2.equals("신안군")) {
					nX = "50";
					nY = "66";
				}
			}

			// 지역이 전라북도
			else if (city1.equals("전북")) {
				if (city2.equals("전주시")) {
					nX = "63";
					nY = "89";
				} else if (city2.equals("군산시")) {
					nX = "56";
					nY = "92";
				} else if (city2.equals("익산시")) {
					nX = "60";
					nY = "91";
				} else if (city2.equals("정읍시")) {
					nX = "58";
					nY = "83";
				} else if (city2.equals("남원시")) {
					nX = "68";
					nY = "80";
				} else if (city2.equals("김제시")) {
					nX = "59";
					nY = "88";
				} else if (city2.equals("완주군")) {
					nX = "63";
					nY = "89";
				} else if (city2.equals("진안군")) {
					nX = "68";
					nY = "88";
				} else if (city2.equals("무주군")) {
					nX = "72";
					nY = "93";
				} else if (city2.equals("장수군")) {
					nX = "70";
					nY = "85";
				} else if (city2.equals("임실군")) {
					nX = "66";
					nY = "84";
				} else if (city2.equals("순창군")) {
					nX = "63";
					nY = "79";
				} else if (city2.equals("고창군")) {
					nX = "56";
					nY = "80";
				} else if (city2.equals("부안군")) {
					nX = "56";
					nY = "87";
				}
			}

			// 지역이 제주특별자치도
			else if (city1.equals("제주특별자치도")) {
				if (city2.equals("제주시")) {
					nX = "53";
					nY = "38";
				} else if (city2.equals("서귀포시")) {
					nX = "52";
					nY = "33";
				}
			}

			// 지역이 충청남도
			else if (city1.equals("충남")) {
				if (city2.equals("천안시")) {
					if (city3.equals("동남구")) {
						nX = "63";
						nY = "110";
					} else if (city3.equals("서북구")) {
						nX = "63";
						nY = "112";
					}
				} else if (city2.equals("공주시")) {
					nX = "63";
					nY = "102";
				} else if (city2.equals("보령시")) {
					nX = "54";
					nY = "100";
				} else if (city2.equals("아산시")) {
					nX = "60";
					nY = "110";
				} else if (city2.equals("서산시")) {
					nX = "51";
					nY = "110";
				} else if (city2.equals("논산시")) {
					nX = "62";
					nY = "97";
				} else if (city2.equals("계룡시")) {
					nX = "65";
					nY = "99";
				} else if (city2.equals("당진시")) {
					nX = "54";
					nY = "112";
				} else if (city2.equals("금산군")) {
					nX = "69";
					nY = "95";
				} else if (city2.equals("부여군")) {
					nX = "59";
					nY = "99";
				} else if (city2.equals("서천군")) {
					nX = "55";
					nY = "94";
				} else if (city2.equals("청양군")) {
					nX = "57";
					nY = "103";
				} else if (city2.equals("홍성군")) {
					nX = "55";
					nY = "106";
				} else if (city2.equals("예산군")) {
					nX = "58";
					nY = "107";
				} else if (city2.equals("태안군")) {
					nX = "48";
					nY = "109";
				}
			}

			// 지역이 충청북도
			else if (city1.equals("충북")) {
				if (city2.equals("청주시")) {
					if (city3.equals("상당구")) {
						nX = "69";
						nY = "106";
					} else if (city3.equals("서원구")) {
						nX = "69";
						nY = "107";
					} else if (city3.equals("흥덕구")) {
						nX = "67";
						nY = "106";
					} else if (city3.equals("청원구")) {
						nX = "69";
						nY = "107";
					}
				} else if (city2.equals("충주시")) {
					nX = "76";
					nY = "114";
				} else if (city2.equals("제천시")) {
					nX = "81";
					nY = "118";
				} else if (city2.equals("보은군")) {
					nX = "73";
					nY = "103";
				} else if (city2.equals("옥천군")) {
					nX = "71";
					nY = "99";
				} else if (city2.equals("영동군")) {
					nX = "74";
					nY = "97";
				} else if (city2.equals("증평군")) {
					nX = "71";
					nY = "110";
				} else if (city2.equals("진천군")) {
					nX = "68";
					nY = "111";
				} else if (city2.equals("괴산군")) {
					nX = "74";
					nY = "111";
				} else if (city2.equals("음성군")) {
					nX = "72";
					nY = "113";
				} else if (city2.equals("단양군")) {
					nX = "84";
					nY = "115";
				}
			}

			String url = "https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst?serviceKey=" + API
					+ "&numOfRows=10" + "&pageNo=1" + "&base_date=" + ymd + "&base_time=" + hour + "&nx=" + nX + "&ny="
					+ nY;

//					System.out.println(url);

			URL u = new URL(url);

			HttpsURLConnection huc = (HttpsURLConnection) u.openConnection();
			InputStream is = huc.getInputStream();

			BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));

			// 나오는 하나하나를 한 덩어리로 뭉치기
			StringBuffer sb = new StringBuffer();
			String line = null;
			while ((line = br.readLine()) != null) {
				sb.append(line.replace("\r\n", ""));
				// 받아온 데이터를 한 덩어리로 뭉쳤고, 엔터키 처리 없앰
			}
//					System.out.println(sb);
			req.setAttribute("city1", city1);
			req.setAttribute("city2", city2);
			req.setAttribute("city3", city3);
			return sb.toString();

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}

import { render, screen } from "@testing-library/react";
import App from "./App";
import { act } from "react-dom/test-utils";

jest.mock("react-i18next", () => ({
  // this mock makes sure any components using the translate hook can use it without a warning being shown
  useTranslation: () => {
    return {
      t: (str) => str,
      i18n: {
        changeLanguage: () => new Promise(() => {}),
      },
    };
  },
}));

test("renders test Top Racers", async () => {
  const { getByText, getAllByText } = await act(() => {
    return render(<App />);
  });

  expect(getByText(/Our Top Racers/i));
});

test("renders Contac US", async () => {
  const { getByText, getAllByText } = await act(() => {
    return render(<App />);
  });

  expect(getAllByText(/Contact US/i));
});

test("renders and test Fixtures", async () => {
  const { getByText, getAllByText } = await act(() => {
    return render(<App />);
  });

  expect(getAllByText(/Fixtures/i));
});
